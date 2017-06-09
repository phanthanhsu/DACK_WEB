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
        public static IEnumerable<SanPham> ListSP()
        {
            using (var db = new ShopConnectionDB())
            {
                return db.Query<SanPham>("Select * From SanPham");
            }
        }
        public static IEnumerable<SanPham> ListSPOfType(string id)
        {
            using (var db = new ShopConnectionDB())
            {
                return db.Query<SanPham>("Select * From SanPham Where MaLoaiSanPham = @0", id);
            }
        } 
        public static SanPham SanPham(string id)
        {
            using (var db = new ShopConnectionDB())
            {
                return db.SingleOrDefault<SanPham>("Select * From SanPham Where MaSanPham = @0", id);
            }
        }
        public static IEnumerable<LoaiSanPham> ListMenu()
        {
            using (var db = new ShopConnectionDB())
            {
                return db.Query<LoaiSanPham>("Select * From LoaiSanPham Where TinhTrang = 1");
            }
        }
        public static IEnumerable<HinhAnh> ListImg(string maSP)
        {
            using (var db = new ShopConnectionDB())
            {
                return db.Query<HinhAnh>("Select * From HinhAnh Where MaSanPham = @0", maSP);
            }
        }
        public static void ThemSP(SanPham ab)
        {
            using (var db = new ShopConnectionDB())
            {
                db.Insert(ab);
            }
        }
        public static HinhAnh Hinh(int id)
        {
            using (var db = new ShopConnectionDB())
            {
                return db.SingleOrDefault<HinhAnh>("Select * From HinhAnh Where MaHinh = @0", id);
            }
        }
        public static void ThemAnh(HinhAnh ab)
        {
            using (var db = new ShopConnectionDB())
            {
                db.Insert(ab);
            }
        }
        public static void XoaAnh(HinhAnh ab)
        {
            using (var db = new ShopConnectionDB())
            {
                db.Delete(ab);
            }
        }
        public static int DemAnh(string id)
        {
            using (var db = new ShopConnectionDB())
            {
                return db.ExecuteScalar<int>("select count(*) from HinhAnh Where MaSanPham = @0", id);
            }
        }
        public static void EditSP(string id, SanPham ab)
        {
            using (var db = new ShopConnectionDB())
            {
                db.Update(ab,id);
            }
        }
        public static void DeleteSP(SanPham sp)
        {
            using (var db = new ShopConnectionDB())
            {
                db.Delete(sp);
            }
        }
        public static void ThemLoaiSP(LoaiSanPham ab)
        {
            ab.TinhTrang = 1;
            using (var db = new ShopConnectionDB())
            {
                db.Insert(ab);
            }
        }
        public static void DeleteLoaiSP(LoaiSanPham lsp)
        {
            lsp.TinhTrang = 0;
            using (var db = new ShopConnectionDB())
            {
                db.Update(lsp);
            }
        }
        public static void EditLoaiSP(string id, LoaiSanPham lsp)
        {
            using (var db = new ShopConnectionDB())
            {
                db.Update(lsp, id);
            }
        }
        public static LoaiSanPham LSp(string id)
        {
            using (var db = new ShopConnectionDB())
            {
                return db.SingleOrDefault<LoaiSanPham>("Select * From LoaiSanPham Where MaLoaiSP = @0", id);
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
        public static GioHang layGH(int id)
        {
            using (var db = new ShopConnectionDB())
            {
                return db.SingleOrDefault<GioHang>("Select * From GioHang Where Id = @0", id);
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
    }
}
