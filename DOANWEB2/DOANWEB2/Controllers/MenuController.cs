using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DOANWEB2.Controllers
{
    public class MenuController : Controller
    {
        // GET: Menu
        public ActionResult TypeProduct()
        {
            return View(ShopBUS.BUS.ListMenu());
        }
    }
}