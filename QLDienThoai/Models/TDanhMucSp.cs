﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace QLDienThoai.Models;

public partial class TDanhMucSp
{
    public string MaSp { get; set; } = null!;

    public string? TenSp { get; set; }

    public string? MaChatLieu { get; set; }

    public string? Model { get; set; }

    public string? MaHangSx { get; set; }

    public string? MaNuocSx { get; set; }

    public string? MaDacTinh { get; set; }

    public string? Website { get; set; }

    public double? ThoiGianBaoHanh { get; set; }

    public string? GioiThieuSp { get; set; }

    public double? ChietKhau { get; set; }

    public string? MaLoai { get; set; }

    public string? MaDt { get; set; }

    public string? AnhDaiDien { get; set; }

    public decimal? GiaNhoNhat { get; set; }

    public decimal? GiaLonNhat { get; set; }
    [NotMapped]
    public IFormFile CoverPhoto { get; set; }

    public virtual TChatLieu? MaChatLieuNavigation { get; set; }

    public virtual TLoaiDt? MaDtNavigation { get; set; }

    public virtual THangSx? MaHangSxNavigation { get; set; }

    public virtual TLoaiSp? MaLoaiNavigation { get; set; }

    public virtual TQuocGium? MaNuocSxNavigation { get; set; }

    public virtual ICollection<TAnhSp> TAnhSps { get; } = new List<TAnhSp>();

    public virtual ICollection<TChiTietHdb> TChiTietHdbs { get; } = new List<TChiTietHdb>();
}
