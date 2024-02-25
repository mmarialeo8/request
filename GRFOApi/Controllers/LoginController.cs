using GJApi.Data;
using GRFOCommon.Common;
using GRFOCommon.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace GRFOApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {

        private readonly IAccount _iAccount;
        public LoginController(IAccount _iAccount)
        {
            this._iAccount = _iAccount;
        }

        [HttpPost(apiRoute.account.authenticate)]
        public async Task<JsonResult> Authenticate(UserModels data)
        {
            return new JsonResult(await _iAccount.Authenticate(data));
        }
    }
}
