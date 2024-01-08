using GJCommon.Common;
using GJCommon.Models;
using GJSamp.Controllers;
using GRFOCommon.Common;
using GRFOCommon.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace GRFO.Controllers
{
    public class MasterController : Controller
    {
        private readonly IConfiguration _configuration;
        public MasterController(IConfiguration configuration)
        {

            _configuration = configuration;
            CommonMembers.apiBaseUrl = _configuration.GetSection("AppSettings:apiBaseUrl").Value;
        }

        [Route("/master/master-data")]
        public async Task<JsonResult> RequestCategory(string tableName, string columnIdName, string columnValueName)
        {
            var authResult = ApiCall.GetAsync(CommonMembers.apiBaseUrl, string.Format(apiRoute.master.get + "?tableName={0}&columnIdName={1}&columnValueName={2}", tableName, columnIdName, columnValueName), null);
            MasterDataResult objMasterData = JsonConvert.DeserializeObject<MasterDataResult>(authResult);
            return new JsonResult(objMasterData);
        }
    }
}
