using GJApi.Data;
using GJCommon.Common;
using GRFOApi.Data;
using GRFOCommon.Common;
using Microsoft.AspNetCore.Mvc;

namespace GRFOApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MigrationDataController : ControllerBase
    {
        private readonly IMigrationData _iMigrationData;
        public MigrationDataController(IMigrationData _iMigrationData)
        {
            this._iMigrationData = _iMigrationData;
        }

        [HttpGet(apiRoute.datamigration.GetNonMigratedData)]
        public async Task<JsonResult> GetNonMigratedData(int requestId)
        {
            return new JsonResult(await _iMigrationData.GetNonMigratedData(requestId));
        }       
    }
}
