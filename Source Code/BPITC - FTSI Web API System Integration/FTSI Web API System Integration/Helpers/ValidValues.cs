namespace FTSI_Web_API_System_Integration.Helpers
{
   public static class DocType {
         public const char Item = 'I';
         public const char Service = 'S';
    }

    public static class AsstStatus
    {
        public const char New = 'N';
        public const char Active = 'A';
        public const char Inactive = 'I';
    }

    public static class ItemType
    {
        public const char Items = 'I';
        public const char Labor = 'L';
        public const char Travel = 'T';
        public const char FixedAssets = 'F';
    }

    public static class DocStatus
    {
        public const char Posted = 'P';
        public const char Drafted = 'D';
        public const char Canceled = 'C';
    }

    public static class DataSource
    {
        public const char Unknown = 'N';
        public const char Interface = 'I';
        public const char Update = 'U';
        public const char Import = 'M';
        public const char DiApi = 'O';
        public const char ServiceLayer = 'S';
        public const char WebClient = 'W';
        public const char DocGenerationWizard = 'A';
        public const char RestoreWizard = 'D';
        public const char PartnerImplementation = 'P';
        public const char YearTransfer = 'T';
    }

    public static class TransType
    {
        public const string ArInvoice = "13";                // A/R Invoice
        public const string ApCreditMemo = "19";             // A/P Credit Memo
        public const string ApInvoice = "18";                // A/P Invoice
        public const string OutgoingPayment = "46";          // Outgoing Payment
        public const string ApCorrectionInvoice = "163";     // A/P Correction Invoice

        // Fixed Asset Related Document Types
        public const string Capitalization = "1470000049";        // Capitalization
        public const string FixedAssetsCreditMemo = "1470000060"; // Fixed Assets Credit Memo
        public const string AllTransactions = "-1";               // All Transactions
        public const string ManualDepreciation = "1470000075";     // Manual Depreciation
        public const string FixedAssetsTransfer = "1470000090";    // Fixed Assets Transfer
        public const string Retirement = "1470000094";             // Retirement
    }
}
