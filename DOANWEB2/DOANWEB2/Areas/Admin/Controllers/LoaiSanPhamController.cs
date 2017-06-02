using ShopConnection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DOANWEB2.Areas.Admin.Controllers
{
    public class LoaiSanPhamController : Controller
    {
        // GET: Admin/LoaiSanPham
        public ActionResult Index()
        {
            var dsLoaiSP = ShopBUS.BUS.ListMenu();
            return View(dsLoaiSP);
        }

        // GET: Admin/LoaiSanPham/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Admin/LoaiSanPham/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/LoaiSanPham/Create
        [HttpPost]
        public ActionResult Create(LoaiSanPham lSp)
        {
            try
            {
                // TODO: Add insert logic here
                ShopBUS.BUS.ThemLoaiSP(lSp);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Admin/LoaiSanPham/Edit/5
        public ActionResult Edit(string id)
        {
            var lSP = ShopBUS.BUS.LSp(id);
            return View(lSP);
        }

        // POST: Admin/LoaiSanPham/Edit/5
        [HttpPost]
        public ActionResult Edit(string id, LoaiSanPham lSp)
        {
            try
            {
                // TODO: Add update logic here
                ShopBUS.BUS.EditLoaiSP(id ,lSp);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Admin/LoaiSanPham/Delete/5
        public ActionResult Delete(string id)
        {
            var lSP = ShopBUS.BUS.LSp(id);
            ShopBUS.BUS.DeleteLoaiSP(lSP);
            return RedirectToAction("Index");
        }

        // POST: Admin/LoaiSanPham/Delete/5
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
