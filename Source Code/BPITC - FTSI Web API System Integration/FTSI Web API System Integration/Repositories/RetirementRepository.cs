using FTSI_Web_API_System_Integration.Data;
using FTSI_Web_API_System_Integration.Interfaces;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.ARCreditMemo;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.Retirement;

namespace FTSI_Web_API_System_Integration.Repositories
{
    public class RetirementRepository : IRetirementRepository
    {
        private readonly FTDBWContext _db;
        public RetirementRepository(FTDBWContext db) => _db = db;
        public async Task AddAsync(RetirementHeader retirement)
        {
            await _db.FTORTI.AddAsync(retirement);
        }

        public async Task<RetirementHeader?> GetStatusAsync(Guid id)
        {
            return await _db.FTORTI.FindAsync(id);
        }

        public void Update(RetirementHeader entity)
        {
            _db.FTORTI.Update(entity);
        }

        public async Task<int> SaveChangesAsync()
        {
            return await _db.SaveChangesAsync();
        }
    }
}
