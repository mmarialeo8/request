using Microsoft.AspNetCore.Mvc;

namespace GRFOWeb.Controllers
{
    public class LoginController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
