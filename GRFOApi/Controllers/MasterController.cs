using GJApi.Data;
using GJCommon.Common;
using GRFOCommon.Models;
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

        [HttpGet(apiRoute.master.AddEdit)]
        public async Task<JsonResult> AddEdit(int id, string tableName, string columnId, string columnName, string columnCaption)
        {
            return new JsonResult(await _iMasterData.GetMasterById(id, tableName, columnId, columnName, columnCaption));
        }

        [HttpPost(apiRoute.master.save)]
        public async Task<JsonResult> Save(MasterDataPostModels data)
        {
            return new JsonResult(await _iMasterData.Save(data));
        }

    }
}
