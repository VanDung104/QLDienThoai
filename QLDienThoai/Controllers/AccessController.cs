using Microsoft.AspNetCore.Mvc;
using QLDienThoai.Models;

namespace QLDienThoai.Controllers
{
    public class AccessController : Controller
    {
        QldienThoaiContext db = new QldienThoaiContext();
        [HttpGet]
        public IActionResult Login()
        {
            if (HttpContext.Session.GetString("UserName") == null)
            {
                return View();
            }
            else
            {
                var g = db.TUsers.Where(x => x.LoaiUser.Equals(1));
                if (g != null)
                {
                    return RedirectToAction("Index", "Home");
                }else
                {
                    return RedirectToAction("Index", "Admin");
                }
            }
        }
        [HttpPost]
        public IActionResult Login(TUser user)
        {
            if (HttpContext.Session.GetString("UserName") == null)
            {
                var u = db.TUsers.Where(x => x.Username.Equals(user.Username) && x.Password.Equals(user.Password)).FirstOrDefault();
                if (u != null)
                {
                    HttpContext.Session.SetString("UserName", u.Username.ToString());
                    var g = db.TUsers.Where(x => x.LoaiUser==1 && x.Username.Equals(HttpContext.Session.GetString("UserName"))).FirstOrDefault();
                    if (g != null)
                    {
                        return RedirectToAction("Index", "Home");
                    }
                    else
                    {
                        return RedirectToAction("Index", "Admin");
                    }
                }
            }
            return View();
        }
        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            HttpContext.Session.Remove("UserName");
            return RedirectToAction("Login", "Access");
        }
    }
}
