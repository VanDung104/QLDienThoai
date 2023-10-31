using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using QLDienThoai.Models;
using QLDienThoai.Models.Authentication;
using X.PagedList;
namespace QLDienThoai.Areas.Admin.Controllers
{
    [Area("admin")]
    [Route("admin")]
    [Route("admin/homeadmin")]
    public class HomeAdminController : Controller
    {

        QldienThoaiContext db = new QldienThoaiContext();
        [Route("")]
        [Route("index")]
        [Authentication]
        public IActionResult Index()
        {
            return View();
        }
        [Authentication]
        [HttpGet]
        [Route("danhmucsanpham")]
        public IActionResult DanhMucSanPham(int? page , string? name)
        {
            int pageSize = 10;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var lstsanpham = db.TDanhMucSps.AsNoTracking().OrderBy(x => x.TenSp);
            if (!string.IsNullOrEmpty(name))
            {
                var lstsploc = db.TDanhMucSps.Where(x => x.TenSp.Contains(name));
                PagedList<TDanhMucSp> lstloc = new(lstsploc, pageNumber, pageSize);
                return View(lstloc);
            }
            else
            {
                PagedList<TDanhMucSp> lst = new(lstsanpham, pageNumber, pageSize);
                return View(lst);
            }
        }
        [Authentication]
        [Route("danhmuckhachhang")]
        [HttpGet]
        public IActionResult DanhMucKhachHang(int? page, string? name)
        {
            int pageSize = 3;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var lstkhachhang = db.TKhachHangs.AsNoTracking().OrderBy(x => x.TenKhachHang);
            if (!string.IsNullOrEmpty(name))
            {
                var lstkhachhangloc = db.TKhachHangs.Where(x => x.TenKhachHang.Contains(name));
                PagedList<TKhachHang> lstloc = new(lstkhachhangloc, pageNumber, pageSize);
                return View(lstloc);
            }
            else
            {
                PagedList<TKhachHang> lst = new(lstkhachhang, pageNumber, pageSize);
                return View(lst);
            }
        }
        [Authentication]
        [Route("themsanphammoi")]
        [HttpGet]
        public IActionResult ThemSanPhamMoi()
        {
            ViewBag.MaChatLieu = new SelectList(db.TChatLieus.ToList(), "MaChatLieu", "ChatLieu");
            ViewBag.MaHangSx = new SelectList(db.THangSxes.ToList(), "MaHangSx", "HangSx");
            ViewBag.MaNuocSx = new SelectList(db.TQuocGia.ToList(), "MaNuoc", "TenNuoc");
            ViewBag.MaLoai = new SelectList(db.TLoaiSps.ToList(), "MaLoai", "Loai");
            ViewBag.MaDt = new SelectList(db.TLoaiDts.ToList(), "MaDt", "TenLoai");
            return View();
        }
        [Route("themsanphammoi")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public  IActionResult ThemSanPhamMoi(TDanhMucSp sanPham)
        {
            if(ModelState.IsValid)
            {
                if(sanPham.CoverPhoto != null)
                {
                    string folder =sanPham.CoverPhoto.FileName;
                    sanPham.AnhDaiDien = folder;
                }
                db.TDanhMucSps.Add(sanPham);
                db.SaveChanges();
                return RedirectToAction("DanhMucSanPham");
            }
            return View(sanPham);
        }

        [Authentication]
        [Route("chinhsuasanpham")]
        [HttpGet]
        public IActionResult ChinhSuaSanPham(string masanpham)
        {
            ViewBag.MaChatLieu = new SelectList(db.TChatLieus.ToList(), "MaChatLieu", "ChatLieu");
            ViewBag.MaHangSx = new SelectList(db.THangSxes.ToList(), "MaHangSx", "HangSx");
            ViewBag.MaNuocSx = new SelectList(db.TQuocGia.ToList(), "MaNuoc", "TenNuoc");
            ViewBag.MaLoai = new SelectList(db.TLoaiSps.ToList(), "MaLoai", "Loai");
            ViewBag.MaDt = new SelectList(db.TLoaiDts.ToList(), "MaDt", "TenLoai");
            var sanpham = db.TDanhMucSps.Find(masanpham);
            return View(sanpham);
        }
        [Route("chinhsuasanpham")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ChinhSuaSanPham(TDanhMucSp sanPham)
        {
            if (ModelState.IsValid)
            {
                if (sanPham.CoverPhoto != null)
                {
                    string folder = sanPham.CoverPhoto.FileName;
                    sanPham.AnhDaiDien = folder;
                }
                db.Entry(sanPham).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("DanhMucSanPham", "HomeAdmin");
            }
            return View(sanPham);
        }
        [Route("XoaSanPham")]
        [HttpGet]
        public IActionResult XoaSanPham(string masanpham)
        {
            TempData["Message"] = "";
            var chiTietHDB = db.TChiTietHdbs.Where(x=>x.MaSp==masanpham).ToList();
            if(chiTietHDB.Count() >0)
            {
                TempData["Message"] = "khong the xoa san pham nay";
                return RedirectToAction("DanhMucSanPham", "HomeAdmin");
            }
            db.Remove(db.TDanhMucSps.Find(masanpham));
            db.SaveChanges();
            TempData["Message"] = "San pham da dc xoa";
            return RedirectToAction("DanhMucSanPham", "HomeAdmin");
        }
        [Authentication]
        [Route("themkhachhang")]
        [HttpGet]
        public IActionResult ThemKhachHang()
        {
            ViewBag.Username = new SelectList(db.TUsers.ToList(), "Username", "Username");
            return View();
        }
        [Route("themkhachhang")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ThemKhachHang(TKhachHang khachHang)
        {
            if (ModelState.IsValid)
            {
                db.TKhachHangs.Add(khachHang);
                db.SaveChanges();
                return RedirectToAction("DanhMucKhachHang");
            }
            return View(khachHang);
        }
    }
}
