using PagedList;
using ShopConnection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DOANWEB2.Controllers
{
    public class ListProductController : Controller
    {
        // GET: ListProduct
        public ActionResult Index()
        {
            return View();
        }

        // GET: ListProduct/ListOfType/5
        public ActionResult ListOfType(string id, int page = 1, int pagesize = 6)
        {
            var dsSP =  ShopBUS.BUS.ListSPOfType(id).ToPagedList(page, pagesize);
            return View(dsSP);
        }

        // GET: ListProduct/Details/5
        public ActionResult Details(string id)
        {
            var sp = ShopBUS.BUS.SanPham(id);
            return View(sp);
        }

        // GET: ListProduct/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ListProduct/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: ListProduct/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: ListProduct/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: ListProduct/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: ListProduct/Delete/5
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
