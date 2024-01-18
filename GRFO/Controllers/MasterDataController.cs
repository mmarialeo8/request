using GJCommon.Common;
using GRFOCommon.Common;
using GRFOCommon.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Diagnostics;

namespace GJSamp.Controllers
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


        //[HttpGet("/request/add")]
        //public async Task<IActionResult> Add()
        //{
        //    return PartialView("_addEditRequest", new RequestPostModels());
        //}

        //[HttpGet("/request/load-hadoop-data")]
        //public async Task<IActionResult> LoadHadoop(string basePartNumber)
        //{
        //    var authResult = ApiCall.GetAsync(CommonMembers.apiBaseUrl, apiRoute.hadoop.get + "?basePartNumber=" + basePartNumber, null);
        //    hadoopDataResponse objData = JsonConvert.DeserializeObject<hadoopDataResponse>(authResult);
        //    return PartialView("_hadoopData", objData.hadoop);
        //}

        //[HttpGet("/request/edit")]
        //public async Task<IActionResult> Edit(int requestId)
        //{
        //    var authResult = ApiCall.GetAsync(CommonMembers.apiBaseUrl, apiRoute.request.getbyid + "?requestId=" + requestId, null);
        //    RequestResponse objRequest = JsonConvert.DeserializeObject<RequestResponse>(authResult);
        //    return PartialView("_addEditRequest", objRequest.request);
        //}

        //[HttpGet("/request/view")]
        //public async Task<IActionResult> View(int requestId)
        //{
        //    var authResult = ApiCall.GetAsync(CommonMembers.apiBaseUrl, apiRoute.request.getbyid + "?requestId=" + requestId, null);
        //    RequestResponse objRequest = JsonConvert.DeserializeObject<RequestResponse>(authResult);
        //    return PartialView("_viewRequest", objRequest.request);
        //}

        //[HttpPost("/request/save")]
        //public async Task<JsonResult> Save(RequestPostModels data)
        //{
        //    var result = await ApiCall.PostAsync(CommonMembers.apiBaseUrl, apiRoute.request.save, data);
        //    TransactionWrapper objRequest = JsonConvert.DeserializeObject<TransactionWrapper>(result);
        //    return new JsonResult(objRequest);
        //}

        //[HttpPost("/request/update")]
        //public async Task<JsonResult> update(RequestUpdateModels data)
        //{
        //    var result = await ApiCall.PostAsync(CommonMembers.apiBaseUrl, apiRoute.request.update, data);
        //    TransactionWrapper objRequest = JsonConvert.DeserializeObject<TransactionWrapper>(result);
        //    return new JsonResult(objRequest);
        //}

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
