using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using ShopConnection;

namespace DOANWEB2.Controllers
{
    [Authorize]
    public class GioHangController : Controller
    {
        // GET: GioHang
        public ActionResult Index()
        {
            return View(ShopBUS.BUS.ListGh(User.Identity.GetUserId()));
        }

        [HttpPost]
        public ActionResult Them(string MaSP, int soluong)
        {
            
            ShopBUS.BUS.ThemGioHang(MaSP, soluong, User.Identity.GetUserId());
            return RedirectToAction("index");
        }

        [HttpPost]
        public ActionResult CapNhatSL(GioHang gh)
        {

            ShopBUS.BUS.CapNhatGioHang(gh);
            return RedirectToAction("index");
        }
    }
}