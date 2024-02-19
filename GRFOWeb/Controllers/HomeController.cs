using ClosedXML.Excel;
using GJCommon.Common;
using GRFOCommon.Common;
using GRFOCommon.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Diagnostics;
using System.Net.Mime;
using System.Text;

namespace GRFOWeb.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IConfiguration _configuration;
        public HomeController(ILogger<HomeController> logger, IConfiguration configuration)
        {
            _logger = logger;
            _configuration = configuration;
            CommonMembers.apiBaseUrl = _configuration.GetSection("AppSettings:apiBaseUrl").Value;
        }

        public IActionResult Index()
        {
            return View();
        }

        [HttpGet("/request/json")]
        public async Task<IActionResult> Json()
        {
            var authResult = ApiCall.GetAsync(CommonMembers.apiBaseUrl, apiRoute.request.get, null);
            RequestResult objRequest = JsonConvert.DeserializeObject<RequestResult>(authResult);
            return new JsonResult(objRequest);
        }

        [HttpGet("/request/add")]
        public async Task<IActionResult> Add()
        {
            return PartialView("_addEditRequest", new RequestPostModels());
        }

        [HttpGet("/request/load-hadoop-data")]
        public async Task<IActionResult> LoadHadoop(string basePartNumber)
        {
            var authResult = ApiCall.GetAsync(CommonMembers.apiBaseUrl, apiRoute.apvData.get + "?basePartNumber=" + basePartNumber, null);
            APVDataResponse objData = JsonConvert.DeserializeObject<APVDataResponse>(authResult);
            return PartialView("_hadoopData", objData.APVData);
        }

        [HttpGet("/request/edit")]
        public async Task<IActionResult> Edit(int requestId)
        {
            var authResult = ApiCall.GetAsync(CommonMembers.apiBaseUrl, apiRoute.request.getbyid + "?requestId=" + requestId, null);
            RequestResponse objRequest = JsonConvert.DeserializeObject<RequestResponse>(authResult);
            return PartialView("_addEditRequest", objRequest.request);
        }

        [HttpGet("/request/view")]
        public async Task<IActionResult> View(int requestId)
        {
            var authResult = ApiCall.GetAsync(CommonMembers.apiBaseUrl, apiRoute.request.getbyid + "?requestId=" + requestId, null);
            RequestResponse objRequest = JsonConvert.DeserializeObject<RequestResponse>(authResult);
            return PartialView("_viewRequest", objRequest.request);
        }

        [HttpPost("/request/save")]
        public async Task<JsonResult> Save(RequestPostModels data)
        {
            var result = await ApiCall.PostAsync(CommonMembers.apiBaseUrl, apiRoute.request.save, data);
            TransactionWrapper objRequest = JsonConvert.DeserializeObject<TransactionWrapper>(result);
            return new JsonResult(objRequest);
        }

        [HttpPost("/request/update")]
        public async Task<JsonResult> update(RequestUpdateModels data)
        {
            var result = await ApiCall.PostAsync(CommonMembers.apiBaseUrl, apiRoute.request.update, data);
            TransactionWrapper objRequest = JsonConvert.DeserializeObject<TransactionWrapper>(result);
            return new JsonResult(objRequest);
        }

        [HttpGet("/request/download-data")]
        public async Task<IActionResult> DownloadData()
        {
            var result = ApiCall.GetAsync(CommonMembers.apiBaseUrl, apiRoute.request.reportdata, null);
            requestReportResult objRequest = JsonConvert.DeserializeObject<requestReportResult>(result);
            using (var workbook = new XLWorkbook())
            {
                var worksheet = workbook.Worksheets.Add("Registration List");
                var currentRow = 1;
                worksheet.Cell(currentRow, 1).Value = "registerId";

                foreach (var repot in objRequest.report)
                {
                    currentRow++;
                    worksheet.Cell(currentRow, 1).Value = repot.RequestId.ToString();
                }

                string contentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                string fileName = "authors.xlsx";

                using (var stream = new MemoryStream())
                {
                    workbook.SaveAs(stream);
                    var content = stream.ToArray();
                    return File(content, contentType, fileName);
                }

            }
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
