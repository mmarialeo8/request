using GJApi.Data;
using GJCommon.Common;
using GRFOCommon.Common;
using Microsoft.AspNetCore.Mvc;

namespace GRFOApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HadoopController : ControllerBase
    {
        private readonly IAPVDataData _iAPVDataData;
        public HadoopController(IAPVDataData _iAPVDataData)
        {
            this._iAPVDataData = _iAPVDataData;
        }

        [HttpGet(apiRoute.apvData.get)]
        public async Task<JsonResult> Get(string basePartNumber)
        {
            return new JsonResult(await _iAPVDataData.GetApvDatList(basePartNumber));
        }

    }
}
