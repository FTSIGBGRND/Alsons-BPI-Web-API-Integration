using FTSI_Web_API_System_Integration.Data;
using FTSI_Web_API_System_Integration.Interfaces;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.IncomingPayment;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.Items;

namespace FTSI_Web_API_System_Integration.Repositories
{
    public class ItemRepository : IItemRepository
    {
        private readonly FTDBWContext _db;
        public ItemRepository(FTDBWContext db) => _db = db;
        public async Task AddAsync(Item item)
        {
            await _db.FTOITM.AddAsync(item);
        }

        public async Task<Item?> GetStatusAsync(Guid id)
        {
            return await _db.FTOITM.FindAsync(id);
        }

        public async Task<int> SaveChangesAsync()
        {
            return await _db.SaveChangesAsync();
        }
    }
}
