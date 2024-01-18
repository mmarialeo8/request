using GJCommon.Common;
using GRFOCommon.Common;
using GRFOCommon.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Diagnostics;

namespace GRFOWeb.Controllers
{
    public class MasterDataController : Controller
    {
        private readonly ILogger<MasterDataController> _logger;
        private readonly IConfiguration _configuration;
        public MasterDataController(ILogger<MasterDataController> logger, IConfiguration configuration)
        {
            _logger = logger;
            _configuration = configuration;
            CommonMembers.apiBaseUrl = _configuration.GetSection("AppSettings:apiBaseUrl").Value;
        }


        [HttpGet("/master-data")]
        public IActionResult Index()
        {
            return View();
        }

        [HttpGet("/master/list-json")]
        public async Task<IActionResult> Json(string tableName, string columnId, string columnName, string captionName)
        {
            ViewData["captionName"] = captionName;
            var authResult = ApiCall.GetAsync(CommonMembers.apiBaseUrl, string.Format(apiRoute.master.get
                + "?tableName={0}&columnIdName={1}&columnValueName={2}", tableName, columnId, columnName), null);
            MasterDataResult objMasterData = JsonConvert.DeserializeObject<MasterDataResult>(authResult);
            return new JsonResult(objMasterData);
        }

        [HttpGet("/master/add-edit")]
        public async Task<IActionResult> Edit(int Id, string tableName, string columnId, string columnName, string columnCaption)
        {

            if (Id.Equals(0))
            {
                return PartialView("_AddEdit", new MasterDataModels
                {
                    columnId = columnId,
                    tableName = tableName,
                    columnIdCaption = columnCaption,
                    columnValueCaption = columnCaption
                });

            }
            else
            {
                var masterTableData = ApiCall.GetAsync(CommonMembers.apiBaseUrl, string.Format(apiRoute.master.AddEdit
                    + "?Id={0}&tableName={1}&columnId={2}&columnName={3}&columnCaption={4}", Id, tableName, columnId, columnName, columnCaption), null);
                MasterDataResponse masterDataResponse = JsonConvert.DeserializeObject<MasterDataResponse>(masterTableData.ToString());
                return PartialView("_AddEdit", masterDataResponse.data);
            }
        }

        [HttpPost("/master/save")]
        public async Task<IActionResult> Save(MasterDataPostModels data)
        {
            var masterTableData = await ApiCall.PostAsync(CommonMembers.apiBaseUrl, apiRoute.master.save, data);
            TransactionWrapper masterDataResponse = JsonConvert.DeserializeObject<TransactionWrapper>(masterTableData.ToString());
            return new JsonResult(masterDataResponse);
        }        

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
