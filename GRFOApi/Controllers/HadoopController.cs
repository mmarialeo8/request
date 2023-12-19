using GJApi.Data;
using GJCommon.Common;
using Microsoft.AspNetCore.Mvc;

namespace GRFOApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HadoopController : ControllerBase
    {
        private readonly IhadoopData _ihadoopData;
        public HadoopController(IhadoopData _ihadoopData)
        {
            this._ihadoopData = _ihadoopData;
        }

        [HttpGet(apiRoute.hadoop.get)]
        public async Task<JsonResult> Get(string basePartNumber)
        {
            return new JsonResult(await _ihadoopData.GetHadoopDataList(basePartNumber));
        }

    }
}
