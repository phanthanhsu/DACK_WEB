using Microsoft.AspNet.Identity;
using ShopConnection;
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
        public ActionResult CapNhatTT()
        {
            return View();
        }

        // POST: ListProduct/Create
        [HttpPost]
        public ActionResult CapNhatTT(UserInfo u)
        {
            try
            {
                // TODO: Add insert logic here
                ShopBUS.BUS.UpdateTT(u);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}