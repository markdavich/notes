public class VehicleController
{
    public string Delete()
    {
        try
            VehService.Delete();
            EmailService.Send();
        catch e
            return badRequest(...);
        end;
    }
}

public class VehService
    {
        deltet()
    }


public class EmailService
    {
        public int Send(...)
        {
            try
                EmailClient.Send(...)
            catch
                Throw;
            end;
        }

    }


public EmailController
{
    public int Send()
        {
            
        }
}



public ResopneseType<T>
{
    
}