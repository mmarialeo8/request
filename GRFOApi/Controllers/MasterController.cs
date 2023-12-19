using GJApi.Data;
using GJCommon.Common;
using Microsoft.AspNetCore.Mvc;

namespace GRFOApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MasterController : ControllerBase
    {
        private readonly IMasterData _iMasterData;
        public MasterController(IMasterData _iMasterData)
        {
            this._iMasterData = _iMasterData;
        }

        [HttpGet(apiRoute.master.get)]
        public async Task<JsonResult> Get(string tableName, string columnIdName, string columnValueName)
        {
            return new JsonResult(await _iMasterData.GetMasterDataList(tableName, columnIdName, columnValueName));
        }

    }
}
