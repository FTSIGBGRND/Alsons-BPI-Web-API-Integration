using FTSI_Web_API_System_Integration.Data;
using FTSI_Web_API_System_Integration.Interfaces;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.AssetDocuments;

namespace FTSI_Web_API_System_Integration.Repositories
{
    public class CapitalizationRepository : ICapitalizationRepository
    {
        private readonly FTDBWContext _db;
        public CapitalizationRepository(FTDBWContext db) => _db = db;
        public async Task AddAsync(AssetDocument asset)
        {
            await _db.FTOACQ.AddAsync(asset);
        }

        public async Task<AssetDocument?> GetStatusAsync(Guid id)
        {
            return await _db.FTOACQ.FindAsync(id);
        }

        public async Task<int> SaveChangesAsync()
        {
            return await _db.SaveChangesAsync();
        }
    }
}
