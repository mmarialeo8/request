using GJApi.Data;
using GJCommon.Common;
using GRFOCommon.Common;
using GRFOCommon.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace GRFOApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HadoopController : ControllerBase
    {
        private readonly IAPVDataData _iAPVDataData;
        private readonly IRequest _iRequest;

        public HadoopController(IAPVDataData _iAPVDataData, IRequest _iRequest)
        {
            this._iAPVDataData = _iAPVDataData;
            this._iRequest = _iRequest;
        }

        [HttpGet(apiRoute.apvData.get)]
        public async Task<JsonResult> Get(string basePartNumber)
        {
            APVDataResponse objData = await _iAPVDataData.GetApvDatList(basePartNumber);
            if (objData.isTransactionDone)
            {
                if (objData.locationPart != null)
                {
                    string customerIds = string.Join(",", objData.locationPart.Distinct().Select(x => x.shiptocust.ToString()).ToArray());
                    if (!string.IsNullOrEmpty(customerIds))
                    {
                        customerResult objCustomerList = await _iRequest.GetCustomerList(customerIds);

                        if (objCustomerList.isTransactionDone)
                        {
                            if (objCustomerList.customers != null)
                            {
                                foreach (var item in objCustomerList.customers)
                                {
                                    (from k in objData.locationPart
                                     where k.shiptocust == item.customerName
                                     select k).ToList().ForEach(k => k.T1T2Category = item.customerType);
                                }
                                objData.APVData.t1CustomerQty = objData.locationPart.Where(x => x.T1T2Category == "T1" || x.T1T2Category == "t1").Sum(m => m.dh_qty);
                                objData.APVData.t2CustomerQty = objData.locationPart.Where(x => x.T1T2Category == "T2" || x.T1T2Category == "t2").Sum(m => m.dh_qty);
                            }
                        }
                    }
                }
            }
            return new JsonResult(objData);
        }

    }
}
