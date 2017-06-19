using ShopConnection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopBUS
{
    public class BUS
    {
        //San pham
        public static String TenSanPham(string id)
        {
            using (var db = new ShopConnectionDB())
            {
                return db.SingleOrDefault<String>("Select TenSanPham From SanPham Where MaSanPham = @0", id);
            }
        }
        public static SanPham SanPham(string id)
        {
            using (var db = new ShopConnectionDB())
            {
                return db.SingleOrDefault<SanPham>("Select * From SanPham Where MaSanPham = @0", id);
            }
        }
        public static IEnumerable<SanPham> ListSP()
        {
            using (var db = new ShopConnectionDB())
            {
                return db.Query<SanPham>("Select * From SanPham Where TinhTrang = 1");
            }
        }
        public static IEnumerable<SanPham> ListSPLQ(string id)
        {
            using (var db = new ShopConnectionDB())
            {
                return db.Query<SanPham>("SELECT * FROM SanPham WHERE MaSanPham <> @0 AND MaLoaiSanPham =  (Select MaLoaiSanPham from SanPham where MaSanPham = @0)", id);
            }
        }
        public static IEnumerable<SanPham> ListSPOfType(string id)
        {
            using (var db = new ShopConnectionDB())
            {
                return db.Query<SanPham>("Select * From SanPham Where TinhTrang = 1 And MaLoaiSanPham = @0", id);
            }
        }
        public static IEnumerable<SanPham> ListSPOfName(string TuKhoa)
        {
            using (var db = new ShopConnectionDB())
            {
                TuKhoa = "%" + TuKhoa + "%";
                return db.Query<SanPham>("Select * From SanPham Where TenSanPham LIKE @0",TuKhoa);
            }
        }
        public static IEnumerable<SanPham> ListSPNangCao(string TuKhoa, string XuatXu, string NhaSanXuat, string MaLoaiSanPham)
        {
            using (var db = new ShopConnectionDB())
            {
                TuKhoa = "%" + TuKhoa + "%";
                XuatXu = "%" + XuatXu + "%";
                NhaSanXuat = "%" + NhaSanXuat + "%";
                return db.Query<SanPham>("Select * From SanPham Where TenSanPham LIKE @0 AND XuatXu LIKE @1 AND NhaSanXuat LIKE @2 AND MaLoaiSanPham = @3", TuKhoa, XuatXu, NhaSanXuat, MaLoaiSanPham);
            }
        }

        //Loai san pham
        public static LoaiSanPham LSp(string id)
        {
            using (var db = new ShopConnectionDB())
            {
                return db.SingleOrDefault<LoaiSanPham>("Select * From LoaiSanPham Where MaLoaiSP = @0", id);
            }
        }
        public static IEnumerable<LoaiSanPham> ListLSP()
        {
            using (var db = new ShopConnectionDB())
            {
                return db.Query<LoaiSanPham>("Select * From LoaiSanPham Where TinhTrang = 1");
            }
        }

        //Hinh anh
        public static int DemAnh(string id)
        {
            using (var db = new ShopConnectionDB())
            {
                return db.ExecuteScalar<int>("select count(*) from HinhAnh Where MaSanPham = @0", id);
            }
        }
        public static HinhAnh Hinh(int id)
        {
            using (var db = new ShopConnectionDB())
            {
                return db.SingleOrDefault<HinhAnh>("Select * From HinhAnh Where MaHinh = @0", id);
            }
        }
        public static IEnumerable<HinhAnh> ListImg(string maSP)
        {
            using (var db = new ShopConnectionDB())
            {
                return db.Query<HinhAnh>("Select * From HinhAnh Where MaSanPham = @0", maSP);
            }
        }

        //Gio hang
        public static GioHang layGH(int id)
        {
            using (var db = new ShopConnectionDB())
            {
                return db.SingleOrDefault<GioHang>("Select * From GioHang Where Id = @0", id);
            }
        }
        public static void ThemGioHang(string MaSP, int sl, string idUser)
        {
            using (var db = new ShopConnectionDB())
            {
                var date = DateTime.Now;
                var gia = db.SingleOrDefault<int>("Select GiaTien From SanPham Where MaSanPham = @0", MaSP);
                GioHang gh = new GioHang()
                {
                    MaSp = MaSP,
                    MaTK = idUser,
                    SoLuong = sl,
                    TongCong = sl*gia,
                    NgayDat = date,
                    TinhTrang = 0
                };
                db.Insert(gh);
            }
        }
        public static void CapNhatGioHang(GioHang gh)
        {
            using (var db = new ShopConnectionDB())
            {
                var ght = layGH(gh.Id);
                var gia = db.SingleOrDefault<int>("Select GiaTien From SanPham Where MaSanPham = @0", ght.MaSp);
                ght.TongCong = gh.SoLuong * gia;
                ght.SoLuong = gh.SoLuong;
                db.Update(ght);
            }
        }
        public static void XoaGioHang(GioHang gh)
        {
            using (var db = new ShopConnectionDB())
            {
                db.Delete(gh);
            }
        }
        public static void ThanhToanGioHang(GioHang gh)
        {
            using (var db = new ShopConnectionDB())
            {
                var hd = new HoaDon();
                hd.MaKH = gh.MaTK;
                hd.MaSP = gh.MaSp;
                hd.SoLuong = gh.SoLuong;
                hd.TongTien = gh.TongCong;
                hd.NgayThanhToan = DateTime.Now;
                db.Insert(hd);
                db.Update(gh);
            }
        }
        public static IEnumerable<v_GioHang> ListGh(string idUser)
        {
            using (var db = new ShopConnectionDB())
            {
                return db.Query<v_GioHang>("Select * From v_GioHang Where MaTK = @0",idUser);
            }
        }

        //Nguoi dung

        public static UserInfo layThongTin(string id)
        {
            using (var db = new ShopConnectionDB())
            {
                return db.SingleOrDefault<UserInfo>("Select * From UserInfo Where IdUser = @0", id);
            }
        }
        public static void InsertTT (string id)
        {
            using (var db = new ShopConnectionDB())
            {
                UserInfo u = new UserInfo();
                u.IdUser = id;
                db.Insert(u);
            }
        }
        public static void UpdateTT(UserInfo u)
        {
            using (var db = new ShopConnectionDB())
            {
                db.Update(u);
            }
        }

        //Binh luan
        public static void ThemBinhLuan(BinhLuan cmt)
        {
            using (var db = new ShopConnectionDB())
            {
                db.Insert(cmt);
            }
        }
        public static IEnumerable<V_Comment> Lay10Cmt(string idsp)
        {
            using (var db = new ShopConnectionDB())
            {
                return db.Query<V_Comment>("select top 10 * from V_Comment where idSP = @0", idsp);
            }
        }
    }
}
