using QLDienThoai.Models;
using Microsoft.AspNetCore.Mvc;

namespace QLDienThoai.ViewComponents
{
    public class HangSxMenuViewComponent : ViewComponent
    {
        QldienThoaiContext db = new QldienThoaiContext();
        public HangSxMenuViewComponent() { }

        public IViewComponentResult Invoke()
        {
            var lst = db.THangSxes.ToList();
            return View(lst);
        }
    }
}
