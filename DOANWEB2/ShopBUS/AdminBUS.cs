using ShopConnection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopBUS
{
    public class AdminBUS
    {
        //San pham
        public static IEnumerable<SanPham> ListSPAdmin()
        {
            using (var db = new ShopConnectionDB())
            {
                return db.Query<SanPham>("Select * From SanPham");
            }
        }
        public static SanPham SanPham(string id)
        {
            using (var db = new ShopConnectionDB())
            {
                return db.SingleOrDefault<SanPham>("Select * From SanPham Where MaSanPham = @0", id);
            }
        }
        public static void ThemSP(SanPham ab)
        {
            using (var db = new ShopConnectionDB())
            {
                ab.TinhTrang = 1;
                db.Insert(ab);
            }
        }
        public static void EditSP(string id, SanPham ab)
        {
            using (var db = new ShopConnectionDB())
            {
                db.Update(ab, id);
            }
        }
        public static void DeleteSP(SanPham sp)
        {
            using (var db = new ShopConnectionDB())
            {
                sp.TinhTrang = 0;
                db.Update(sp);
            }
        }
        public static void UnDeleteSP(SanPham sp)
        {
            using (var db = new ShopConnectionDB())
            {
                sp.TinhTrang = 1;
                db.Update(sp);
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
        public static IEnumerable<LoaiSanPham> ListMenuAdmin()
        {
            using (var db = new ShopConnectionDB())
            {
                return db.Query<LoaiSanPham>("Select * From LoaiSanPham");
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
        public static void EditLoaiSP(string id, LoaiSanPham lsp)
        {
            using (var db = new ShopConnectionDB())
            {
                db.Update(lsp, id);
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
        public static void UnDeleteLoaiSP(LoaiSanPham lsp)
        {
            lsp.TinhTrang = 1;
            using (var db = new ShopConnectionDB())
            {
                db.Update(lsp);
            }
        }

        //Hinh anh
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

        //Thong ke
        public static IEnumerable<SanPham> GetTop10byLSP(string LSP)
        {
            using (var db = new ShopConnectionDB())
            {
                return db.Query<SanPham>("Select TOP 10 * from SanPham where MaLoaiSanPham = @0 and MaSanPham in (select top 10 MaSP from HoaDon Group by MaSP ORDER BY SUM(SoLuong) DESC)", LSP);
            }
        }
        public static IEnumerable<SanPham> GetTop10()
        {
            using (var db = new ShopConnectionDB())
            {
                return db.Query<SanPham>("Select * from SanPham where MaSanPham in (select top 10 MaSP from HoaDon  Group by MaSP ORDER BY SUM(SoLuong) DESC)");
            }
        }

        //Don hang
        public static GioHang layGH(int id)
        {
            using (var db = new ShopConnectionDB())
            {
                return db.SingleOrDefault<GioHang>("Select * From GioHang Where Id = @0", id);
            }
        }

        public static IEnumerable<V_DonHang> ListDonHang()
        {
            using (var db = new ShopConnectionDB())
            {
                return db.Query<V_DonHang>("Select * From V_DonHang");
            }
        }
        public static V_DonHang layDonHang(int id)
        {
            using (var db = new ShopConnectionDB())
            {
                return db.SingleOrDefault<V_DonHang>("Select * From V_DonHang Where Id = @0", id);
            }
        }
        public static void Duyet(V_DonHang ab)
        {
            using (var db = new ShopConnectionDB())
            {
                var dh = new GioHang();
                dh = layGH(ab.Id);
                dh.TinhTrang = 1;
                db.Update(dh);
            }
        }
        public static void Giao(V_DonHang ab)
        {
            using (var db = new ShopConnectionDB())
            {
                var dh = new GioHang();
                dh = layGH(ab.Id);
                dh.TinhTrang = 3;
                db.Update(dh);
            }
        }
        public static void HoanTat(V_DonHang ab)
        {
            using (var db = new ShopConnectionDB())
            {
                var dh = new GioHang();
                dh = layGH(ab.Id);
                dh.TinhTrang = 4;
                db.Update(dh);
            }
        }
    }
}
