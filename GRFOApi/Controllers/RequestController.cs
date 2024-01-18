using GJApi.Data;
using GJCommon.Common;
using GRFOCommon.Common;
using GRFOCommon.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace GJApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RequestController : ControllerBase
    {
        private readonly IRequest _iRequest;
        public RequestController(IRequest _iRequest)
        {
            this._iRequest = _iRequest;
        }


        [HttpGet(apiRoute.request.get)]
        public async Task<JsonResult> Get()
        {
            return new JsonResult(await _iRequest.GetRequestList());
        }

        [HttpGet(apiRoute.request.getbyid)]
        public async Task<JsonResult> Get(int requestid)
        {
            return new JsonResult(await _iRequest.GetRequestById(requestid));
        }

        [HttpPost(apiRoute.request.save)]
        public async Task<JsonResult> Post(RequestPostModels data)
        {
            return new JsonResult(await _iRequest.SaveRequest(data));
        }

        [HttpPost(apiRoute.request.update)]
        public async Task<JsonResult> update(RequestUpdateModels data)
        {
            return new JsonResult(await _iRequest.UpdateRequest(data));
        }

        [HttpGet(apiRoute.request.delete)]
        public async Task<JsonResult> Delete(int requestid)
        {
            return new JsonResult("");
        }


        [HttpGet(apiRoute.request.reportdata)]
        public async Task<JsonResult> ReportData()
        {
            return new JsonResult(await _iRequest.ReportData());
        }

    }
}
