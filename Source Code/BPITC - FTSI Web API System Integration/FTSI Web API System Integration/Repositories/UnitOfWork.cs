using FTSI_Web_API_System_Integration.Data;
using FTSI_Web_API_System_Integration.Interfaces;

namespace FTSI_Web_API_System_Integration.Repositories
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly FTDBWContext _db;

        public IItemRepository Item { get; private set; }
        public ICapitalizationRepository Capitalization { get; private set; }

        public IJournalEntryRepository JournalEntry { get; private set; }

        public IBusinessPartnerRepository BusinessPartner { get; private set; }

        public UnitOfWork(FTDBWContext db)
        {
            _db = db;
            Item = new ItemRepository(_db);
            Capitalization = new CapitalizationRepository(_db);
            BusinessPartner = new BusinessPartnerRepository(_db);
            JournalEntry = new JournalEntryRepository(_db);
        }

        public async Task<int> Save()
        {
            return await _db.SaveChangesAsync();
        }
    }
}
