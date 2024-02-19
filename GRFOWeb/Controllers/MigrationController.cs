using GRFOCommon.Common;
using GRFOCommon.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace GRFOWeb.Controllers
{
    public class MigrationController : Controller
    {

        [Route("/download-data")]
        public async Task<IActionResult> Index()
        {
            var transactionResult = ApiCall.GetAsync(CommonMembers.apiBaseUrl, apiRoute.request.getlastrequestId, null);
            TransactionWrapper objTransactionData = JsonConvert.DeserializeObject<TransactionWrapper>(transactionResult);
            ViewBag.lastRequestId = objTransactionData.isTransactionDone ? objTransactionData.transactionMessage : "0";
            return View();
        }


        [HttpGet("/migration/get-non-migrated-data-json")]
        public async Task<JsonResult> GetNonMigratedData(int requestId)
        {
            var transactionResult = ApiCall.GetAsync(CommonMembers.apiBaseUrl, apiRoute.datamigration.GetNonMigratedData + "?requestId=" + requestId, null);
            GPSTResult objTransactionData = JsonConvert.DeserializeObject<GPSTResult>(transactionResult);
            return new JsonResult(objTransactionData);
        }

        [HttpGet("/migration/update-data")]
        public async Task<JsonResult> UpdateData(int requestId)
        {
            var transactionResult = ApiCall.GetAsync(CommonMembers.apiBaseUrl, apiRoute.request.downloadupdatedata + "?requestId=" + requestId, null);
            GPSTResult objTransactionData = JsonConvert.DeserializeObject<GPSTResult>(transactionResult);
            return new JsonResult(objTransactionData);
        }
    }
}
