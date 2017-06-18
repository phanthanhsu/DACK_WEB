using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopConnection;
namespace DOANWEB2.Areas.Admin.Controllers
{
    [Authorize(Roles ="admin")]
    public class ThongKeController : Controller
    {
        // GET: Admin/ThongKe
        [HttpGet]
        public ActionResult Index()
        {
            ViewBag.Top10 = ShopBUS.AdminBUS.GetTop10();
            ViewBag.dsLSP = ShopBUS.AdminBUS.ListMenuAdmin();
            return View();
        }
        [HttpPost]
        public ActionResult Index(FormCollection f)
        {
            ViewBag.dsLSP = ShopBUS.AdminBUS.ListMenuAdmin();
            if (f["txtLoaiSanPham"] == "tatca")
            {
                ViewBag.Top10 = ShopBUS.AdminBUS.GetTop10();
            }
            else
            {
                String id = f["txtLoaiSanPham"];
                ViewBag.Top10 = ShopBUS.AdminBUS.GetTop10byLSP(id);
            }
            return View();
        }
    }
}