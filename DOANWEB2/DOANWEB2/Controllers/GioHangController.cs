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
            if (gh.SoLuong == 0)
            {
                ShopBUS.BUS.XoaGioHang(gh);
                return RedirectToAction("index");
            }
            ShopBUS.BUS.CapNhatGioHang(gh);
            return RedirectToAction("index");
        }
        [HttpPost]
        public ActionResult Xoa(GioHang gh)
        {
            return RedirectToAction("index");
        }

        public ActionResult ThanhToan(int id)
        {
            var gh = ShopBUS.BUS.layGH(id);
            gh.TinhTrang = 2;
            ShopBUS.BUS.ThanhToanGioHang(gh);
            return RedirectToAction("index");
        }
    }
}