﻿using ShopConnection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DOANWEB2.Areas.Admin.Controllers
{
    [Authorize(Roles ="admin")]
    public class SanPhamController : Controller
    {
        // GET: Admin/SanPham
        public ActionResult Index()
        {
            var db = new ShopConnectionDB();
            IEnumerable<SanPham> dsSP = ShopBUS.AdminBUS.ListSPAdmin();
            return View(dsSP);
        }

        // GET: Admin/SanPham/DelImg/5
        public ActionResult DelImg(int id)
        {
            var sp = ShopBUS.AdminBUS.Hinh(id);
            ShopBUS.AdminBUS.XoaAnh(sp);
            return RedirectToAction("ImgOfSP", new { id = sp.MaSanPham.Trim() });
        }

        // GET: Admin/SanPham/ImgOfSP/5
        public ActionResult ImgOfSP(string id)
        {
            var DSImg = ShopBUS.AdminBUS.ListImg(id);
            return View(DSImg);
        }

        // POST: Admin/SanPham/ImgOfSP/5
        [HttpPost]
        public ActionResult ImgOfSP(string id, HinhAnh ha)
        {
            try
            {
                // TODO: Add delete logic here
                var hpf = HttpContext.Request.Files[0];
                if (hpf.ContentLength > 0)
                {
                    int sl = ShopBUS.AdminBUS.DemAnh(id) + 1;
                    string name = id + "_00" + sl + ".png";
                    string fullName = "~/Public/images/" + name;
                    hpf.SaveAs(Server.MapPath(fullName));
                    ha.URL = name;
                    ha.MaSanPham = id;
                    ShopBUS.AdminBUS.ThemAnh(ha);
                }
                return RedirectToAction("ImgOfSP", new { id });
            }
            catch
            {
                return View();
            }
}

        // GET: Admin/SanPham/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/SanPham/Create
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(SanPham sp)
        {
            try
            {
                var hpf = HttpContext.Request.Files[0];
                if(hpf.ContentLength > 0)
                {
                    string name = sp.MaSanPham + "_001.png";
                    string fullName = "~/Public/images/" + name;
                    hpf.SaveAs(Server.MapPath(fullName));
                    sp.HinhAnh = name;
                }
                var ha = new HinhAnh();
                ha.URL = sp.HinhAnh;
                ha.MaSanPham = sp.MaSanPham;
                // TODO: Add insert logic here
                ShopBUS.AdminBUS.ThemSP(sp);
                ShopBUS.AdminBUS.ThemAnh(ha);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Admin/SanPham/Edit/5
        public ActionResult Edit(string id)
        {
            var sp = ShopBUS.AdminBUS.SanPham(id);
            ViewBag.MaLoaiSanPham = new SelectList(ShopBUS.AdminBUS.ListMenuAdmin(), "MaLoaiSP", "TenLoaiSanPham",sp.MaLoaiSanPham);
            return View(sp);
        }

        // POST: Admin/SanPham/Edit/5
        
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(string id, SanPham sp)
        {
            var spTam = ShopBUS.AdminBUS.SanPham(id);
            sp = spTam;
            try
            {
                var hpf = HttpContext.Request.Files[0];
                if (hpf.ContentLength > 0)
                {
                    string name = sp.MaSanPham.Trim() + "_001.png";
                    string fullName = "~/Public/images/" + name;
                    hpf.SaveAs(Server.MapPath(fullName));
                    sp.HinhAnh = name;
                }
                // TODO: Add update logic here
                ShopBUS.AdminBUS.EditSP(id, sp);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Admin/SanPham/Delete/5
        public ActionResult Delete(string id)
        {
            var sp = ShopBUS.AdminBUS.SanPham(id);
            ShopBUS.AdminBUS.DeleteSP(sp);
            return RedirectToAction("Index");
        }

        public ActionResult UnDelete(string id)
        {
            var sp = ShopBUS.AdminBUS.SanPham(id);
            ShopBUS.AdminBUS.UnDeleteSP(sp);
            return RedirectToAction("Index");
        }

        // POST: Admin/SanPham/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
