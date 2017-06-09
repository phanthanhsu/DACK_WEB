using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DOANWEB2.Models;
using PagedList.Mvc;
using PagedList;

namespace DOANWEB2.Controllers
{
    public class TimKiemController : Controller
    {
        // GET: TimKiem
        public ActionResult KetQuaTimKiem(FormCollection f, int page = 1, int pagesize = 6)
        {
            string TuKhoa = f["txtTimKiem"].ToString();
            var dsSP = ShopBUS.BUS.ListSPOfName(TuKhoa).ToPagedList(page, pagesize);
            ViewBag.TuKhoa = TuKhoa;
            return View(dsSP);
        }
        public ActionResult KetQuaTimKiemNangCao(FormCollection f, int page = 1, int pagesize = 6)
        {
            string TuKhoa = f["txtTimKiem"].ToString();
            string XuatXu = f["txtXuatXu"].ToString();
            string NhaSanXuat = f["txtNhaSanXuat"].ToString();
            string LoaiSanPham = f["txtLoaiSanPham"].ToString();
            var dsSP = ShopBUS.BUS.ListSPNangCao(TuKhoa, XuatXu, NhaSanXuat, LoaiSanPham).ToPagedList(page, pagesize);
            ViewBag.TuKhoa = "Kết quả tìm kiếm nâng cao";
            return View(dsSP);
        }
    }
}