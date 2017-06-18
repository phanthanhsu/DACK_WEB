using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopConnection;
namespace DOANWEB2.Areas.Admin.Controllers
{
    public class ThongKeController : Controller
    {
        // GET: Admin/ThongKe
        [HttpGet]
        public ActionResult Index()
        {
            ViewBag.Top10 = ShopBUS.BUS.GetTop10();
            ViewBag.dsLSP = ShopBUS.BUS.ListLSP();
            return View();
        }
        [HttpPost]
        public ActionResult Index(FormCollection f)
        {
            ViewBag.dsLSP = ShopBUS.BUS.ListLSP();
            if (f["txtLoaiSanPham"] == "tatca")
            {
                ViewBag.Top10 = ShopBUS.BUS.GetTop10();
            }
            else
            {
                String id = f["txtLoaiSanPham"];
                ViewBag.Top10 = ShopBUS.BUS.GetTop10byLSP(id);
            }
            return View();
        }
    }
}