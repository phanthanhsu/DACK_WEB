using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DOANWEB2.Areas.Admin.Controllers
{
    [Authorize(Roles = "admin")]
    public class DonHangController : Controller
    {
        // GET: Admin/DonHang
        public ActionResult Index()
        {
            ViewBag.DSDonHang = ShopBUS.AdminBUS.ListDonHang();
            return View();
        }
        // GET: Admin/DonHang/Duyet/5
        public ActionResult Duyet(int id)
        {
            var dh = ShopBUS.AdminBUS.layDonHang(id);
            ShopBUS.AdminBUS.Duyet(dh);
            return RedirectToAction("index");
        }
        public ActionResult Giao(int id)
        {
            var dh = ShopBUS.AdminBUS.layDonHang(id);
            ShopBUS.AdminBUS.Giao(dh);
            return RedirectToAction("index");
        }
        public ActionResult HoanTat(int id)
        {
            var dh = ShopBUS.AdminBUS.layDonHang(id);
            ShopBUS.AdminBUS.HoanTat(dh);
            return RedirectToAction("index");
        }
    }
}