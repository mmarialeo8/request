using Microsoft.AspNetCore.Mvc;

namespace GRFOWeb.Controllers
{
    public class DashboardController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
