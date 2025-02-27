using FTSI_Web_API_System_Integration.Data;
using FTSI_Web_API_System_Integration.Interfaces;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.ARCreditMemo;

namespace FTSI_Web_API_System_Integration.Repositories
{
    public class APCreditMemoRepository : IAPCreditMemoRepository
    {
        private readonly FTDBWContext _db;
        public APCreditMemoRepository(FTDBWContext db) => _db = db;
        public async Task AddAsync(APCreditMemoHeader creditMemo)
        {
            await _db.FTORPC.AddAsync(creditMemo);
        }

        public async Task<APCreditMemoHeader?> GetStatusAsync(Guid id)
        {
            return await _db.FTORPC.FindAsync(id);
        }

        public void Update(APCreditMemoHeader entity)
        {
            _db.FTORPC.Update(entity);
        }

        public async Task<int> SaveChangesAsync()
        {
            return await _db.SaveChangesAsync();
        }
    }
}
