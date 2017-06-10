using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DOANWEB2.Controllers
{
    [Authorize]
    public class ThongTinController : Controller
    {
        // GET: ThongTin
        public ActionResult Index()
        {
            return View(ShopBUS.BUS.layThongTin(User.Identity.GetUserId()));
        }
    }
}