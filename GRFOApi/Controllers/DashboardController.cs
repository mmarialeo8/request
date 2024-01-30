using GJApi.Data;
using GJCommon.Common;
using GRFOCommon.Common;
using Microsoft.AspNetCore.Mvc;

namespace GRFOApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DashboardController : ControllerBase
    {
        private readonly IDashboardData _iDashboardData;
        public DashboardController(IDashboardData _iDashboardData)
        {
            this._iDashboardData = _iDashboardData;
        }

        [HttpGet(apiRoute.dashboard.get)]
        public async Task<JsonResult> Get(string? dateFrom, string? dateTo)
        {
            return new JsonResult(await _iDashboardData.GetDashboardData(dateFrom, dateTo));
        }

    }
}
