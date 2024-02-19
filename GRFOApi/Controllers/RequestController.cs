using GJApi.Data;
using GJCommon.Common;
using GRFOApi.Data;
using GRFOCommon.Common;
using GRFOCommon.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using static System.Runtime.InteropServices.JavaScript.JSType;
// using static System.Runtime.InteropServices.JavaScript.JSType;

namespace GJApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RequestController : ControllerBase
    {
        private readonly IRequest _iRequest;
        private readonly IMigrationData _iMigrationData;
        private readonly IAPVDataData _iAPVDataData;
        private readonly IMasterData _iMasterData;
        public RequestController(IRequest _iRequest, IMigrationData _iMigrationData, IAPVDataData _iAPVDataData, IMasterData _iMasterData)
        {
            this._iRequest = _iRequest;
            this._iMigrationData = _iMigrationData;
            this._iAPVDataData = _iAPVDataData;
            this._iMasterData = _iMasterData;
        }


        [HttpGet(apiRoute.request.get)]
        public async Task<JsonResult> Get()
        {
            return new JsonResult(await _iRequest.GetRequestList());
        }

        [HttpGet(apiRoute.request.getbyid)]
        public async Task<JsonResult> Get(int requestid)
        {
            return new JsonResult(await _iRequest.GetRequestById(requestid));
        }

        [HttpPost(apiRoute.request.save)]
        public async Task<JsonResult> Post(RequestPostModels data)
        {
            return new JsonResult(await _iRequest.SaveRequest(data));
        }

        [HttpPost(apiRoute.request.update)]
        public async Task<JsonResult> update(RequestUpdateModels data)
        {
            return new JsonResult(await _iRequest.UpdateRequest(data));
        }

        [HttpGet(apiRoute.request.delete)]
        public async Task<JsonResult> Delete(int requestid)
        {
            return new JsonResult("");
        }



        [HttpGet(apiRoute.customer.getcustomerlist)]
        public async Task<JsonResult> GetCustomerList(string customerIds)
        {
            return new JsonResult(await _iRequest.GetCustomerList(customerIds));
        }



        [HttpGet(apiRoute.request.reportdata)]
        public async Task<JsonResult> ReportData()
        {
            return new JsonResult(await _iRequest.ReportData());
        }



        [HttpGet(apiRoute.request.getlastrequestId)]
        public async Task<JsonResult> GetLastRequestId()
        {
            return new JsonResult(await _iRequest.GetLastRequestId());
        }

        [HttpGet(apiRoute.request.downloadupdatedata)]
        public async Task<JsonResult> DownloadUpdateData(int requestId)
        {
            GPSTResult gpstResult = await _iMigrationData.GetNonMigratedData(requestId);
            if (gpstResult.isTransactionDone)
            {
                if (gpstResult.gpstData != null && gpstResult.gpstData.Count > 0)
                {
                    foreach (var item in gpstResult.gpstData)
                    {
                        APVDataResponse apvData = await _iAPVDataData.GetApvDatList(item.base_part_number);

                        RequestPostModels request = new RequestPostModels();

                        request.requestId = 0;
                        request.requestCategoryId = await _iMasterData.GetMasterIdByName("RepairCategory", "RepairCategoryId", "RepairCategory", item.project_type);
                        request.businessTypeId = await _iMasterData.GetMasterIdByName("BusinessType", "BusinessTypeId", "BusinessType", item.project_sub_type);
                        request.requestSourceId = item.process_step.ToLower().Equals("first article inspection") ? 6 : (!item.process_step.ToLower().Equals("graduated") || !item.process_step.ToLower().Equals("first article inspection") || !item.process_step.ToLower().Equals("cancelled") || !item.process_step.ToLower().Equals("graduated to cancelled")) ? 5 : 0;

                        request.exectiveName = "-";
                        request.ccNumber = "-";
                        request.grfoComment = item.grfo_comment_actions_summary;

                        request.requestorProjectGroup = "-";
                        request.requestor = item.project_requestor;
                        request.basePartNumber = item.base_part_number;
                        request.solutionPartNumber = item.solution_part_number;
                        request.needByDate = "";
                        request.buNameId = await _iMasterData.GetMasterIdByName("[BUNames]", "BUNameId", "BUName", item.project_sub_type);
                        request.repairLocationId = 0;
                        request.targetCustomer = item.customer_code;
                        request.customerLocationId = 0;
                        request.annualRepairForecast1 = 0;
                        request.annualRepairForecast2 = 0;
                        request.comments = "-";
                        request.partDescription = item.part_description;
                        request.stdCostBasePart = 0;
                        request.annualRepairForecast = 0;
                        request.extendedSpendPotential = 0;
                        request.t1CustomerQty = 0;
                        request.t2CustomerQty = 0;
                        request.mg3 = 0;
                        request.prdImplementation = true;
                        request.pbg = "-";

                        request.partRequestId = item.part_request_id;

                        TransactionWrapper transaction = await _iRequest.SaveRequest(request);
                    }
                }
            }
            return new JsonResult(await _iRequest.GetLastRequestId());
        }

    }
}
