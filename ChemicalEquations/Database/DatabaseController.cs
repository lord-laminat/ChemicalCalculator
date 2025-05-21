using ChemicalEquations.Models;
using Microsoft.Data.SqlClient;
using System.Diagnostics;

namespace ChemicalEquations.Database
{
    public static class DatabaseController
    {
        private static SqlConnection? Connection { get; set; }

        public static void Connect(string connectionString)
        {
            Connection = new SqlConnection(connectionString);
            if (Connection == null) throw new ApplicationException("Can't connect to the database");
        }
        public static void Disconnect()
        {
            Connection?.Dispose();
        }

        public static ParticleModel GetParticleModel(string symbol)
        {
            ParticleModel? particle = null;
            try
            {
                Connection?.Open();

                using (SqlCommand command = new($"SELECT TOP 1 * FROM [dbo].[particles] WHERE symbol='{symbol.Trim()}'", Connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            int p_id = reader.GetInt32(0);
                            string p_symbol = reader.GetString(1).Trim();
                            short p_charge = (short)reader.GetInt32(2);
                            int? p_cationId = reader.IsDBNull(3) ? null : reader.GetInt32(3);
                            int? p_anionId = reader.IsDBNull(4) ? null : reader.GetInt32(4);
                            bool p_isSoluble = reader.GetBoolean(5);

                            particle = new ParticleModel(
                                p_id,
                                p_symbol,
                                p_charge,
                                p_cationId,
                                p_anionId,
                                p_isSoluble
                            );
                        }
                    }
                }
            }
            catch (Exception ex) { Debug.WriteLine($"WARN:DatabaseController:GetIon: {ex}"); }
            finally { Connection?.Close(); }

            if (particle != null) return particle;
            else throw new ApplicationException($"Can't get particle: symbol={symbol}");
        }


        public static ParticleModel GetParticleModel(int id)
        {
            ParticleModel? particle = null;
            try
            {
                Connection?.Open();

                using (SqlCommand command = new($"SELECT TOP 1 * FROM particles WHERE id={id}", Connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            int p_id = reader.GetInt32(0);
                            string p_symbol = reader.GetString(1).Trim();
                            short p_charge = (short)reader.GetInt32(2);
                            int? p_cationId = reader.IsDBNull(3) ? null : reader.GetInt32(3);
                            int? p_anionId = reader.IsDBNull(4) ? null : reader.GetInt32(4);
                            bool p_isSoluble = reader.GetBoolean(5);

                            particle = new ParticleModel(
                                p_id,
                                p_symbol,
                                p_charge,
                                p_cationId,
                                p_anionId,
                                p_isSoluble
                            );
                        }
                    }
                }
            }
            catch (Exception ex) { Console.WriteLine($"WARN:DatabaseController:GetIon: {ex}");}
            finally { Connection?.Close(); }

            if (particle != null) return particle;
            else throw new ApplicationException($"Can't get particle: id={id}");
        }
    }
}
