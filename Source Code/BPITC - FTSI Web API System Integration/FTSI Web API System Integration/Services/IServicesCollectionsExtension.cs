using FTSI_Web_API_System_Integration.Data;
using FTSI_Web_API_System_Integration.Interfaces;
using FTSI_Web_API_System_Integration.Profiles;
using FTSI_Web_API_System_Integration.Repositories;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System.Text;

namespace FTSI_Web_API_System_Integration.Services
{
    public static class IServicesCollectionsExtension
    {

        public static void AddFTDBWDbContext(this IServiceCollection services, IConfiguration configuration)
        {
            var connectionString = configuration.GetConnectionString("FTDBWConnection");
            var sqlSettings = configuration.GetSection("MySqlSettings").GetChildren().ToList();

            int build = Convert.ToInt32(sqlSettings[0].Value);
            int major = Convert.ToInt32(sqlSettings[1].Value);
            int minor = Convert.ToInt32(sqlSettings[2].Value);

            services.AddDbContext<FTDBWContext>(options =>
                options.UseMySql(
                    connectionString,
                    new MySqlServerVersion(new Version(major, minor, build))));
        }

        public static void AddAutoMapperServices(this IServiceCollection services)
        {
            services.AddAutoMapper(typeof(ARInvoiceProfiles));
        }
        public static void AddRepositoryServices(this IServiceCollection services)
        {
            services.AddTransient<IARInvoiceRepository, ARInvoiceRepository>();
            services.AddTransient<IAPInvoiceRepository, APInvoiceRepository>();
            services.AddTransient<IARCreditMemoRepository, ARCreditMemoRepository>();
            services.AddTransient<IIncomingPaymentRepository, IncomingPaymentRepository>();
            services.AddTransient<IARDownpaymentRepository, ARDownpaymentRepository>();
            services.AddTransient<IBusinessPartnerRepository, BusinessPartnerRepository>();
            services.AddTransient<IAPCreditMemoRepository, APCreditMemoRepository>();
            services.AddTransient<IRetirementRepository, RetirementRepository>();
        }

        public static void AddSAPServices(this IServiceCollection services)
        {
            services.AddTransient<ARInvoiceService>();
            services.AddTransient<ARCreditMemoService>();
            services.AddTransient<IncomingPaymentService>();
            services.AddTransient<ARDownpaymentService>();
            services.AddTransient<BusinessPartnerService>();
            services.AddTransient<APInvoiceService>();
            services.AddTransient<APCreditMemoService>();
            services.AddTransient<FixedAssetService>();
            services.AddTransient<RetirementService>();
            services.AddTransient<JournalEntryService>();
        }

        public static void AddUnitOfWork(this IServiceCollection services)
        {
            services.AddTransient<IUnitOfWork, UnitOfWork>();
        }
        public static void AddJWTSecurity(this IServiceCollection services, IConfiguration configuration)
        {

            // JWT Authentication settings
            var jwtSettings = configuration.GetSection("JwtSettings");

            services.AddAuthentication(options =>
            {
                options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            })
            .AddJwtBearer(options =>
            {
                options.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuer = true,
                    ValidateAudience = true,
                    ValidateLifetime = true,
                    ValidateIssuerSigningKey = true,
                    ValidIssuer = jwtSettings["Issuer"],
                    ValidAudience = jwtSettings["Audience"],
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwtSettings["Key"]))
                };
            });


            services.AddSingleton<JwtTokenService>();
        }
    }
}
