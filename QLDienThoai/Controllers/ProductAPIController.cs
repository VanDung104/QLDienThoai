using Microsoft.AspNetCore.Mvc;
using QLDienThoai.Models;

namespace QLDienThoai.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductAPIController : ControllerBase
    {

        QldienThoaiContext db = new QldienThoaiContext();
        //[HttpGet]

        //public IEnumerable<THangSx> GetAllProducts()
        //{
        //    return db.THangSxes.ToList();
        //}
        [Route("{mahangSx}")]
        public List<TDanhMucSp> GetAllProductByBrand(string mahangSx)
        {
            var lst = db.TDanhMucSps.Where(x => x.MaHangSx == mahangSx).OrderBy(x => x.TenSp).ToList();
            return lst;
        }
    }
}
