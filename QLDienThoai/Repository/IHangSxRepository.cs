﻿using QLDienThoai.Models;

namespace QLDienThoai.Repository
{
    public interface IHangSxRepository
    {
        THangSx Add(THangSx hangSx);
        THangSx Update(THangSx hangSx);
        THangSx Delete(String mahangSx);
        THangSx GetLoaiSp(String mahangSx);
        IEnumerable<THangSx> GetAllhangSx();
    }
}
