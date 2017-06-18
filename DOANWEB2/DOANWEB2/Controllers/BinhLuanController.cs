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
    public class BinhLuanController : Controller
    {
        // GET: BinhLuan
        public ActionResult Index()
        {
            return View();
        }

        // GET: BinhLuan/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: BinhLuan/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: BinhLuan/Create
        [HttpPost]
        public ActionResult Create(BinhLuan cmt)
        {
            try
            {
                // TODO: Add insert logic here
                cmt.idaccount = User.Identity.GetUserId();
                cmt.tinhtrang = 1;
                ShopBUS.BUS.ThemBinhLuan(cmt);
                return RedirectToAction("Details", "ListProduct", new { id = cmt.idSP.Trim() });
            }
            catch
            {
                return View();
            }
        }

        // GET: BinhLuan/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: BinhLuan/Edit/5
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

        // GET: BinhLuan/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: BinhLuan/Delete/5
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
