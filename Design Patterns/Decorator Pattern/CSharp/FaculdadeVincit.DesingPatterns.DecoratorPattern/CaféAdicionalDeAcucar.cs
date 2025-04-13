namespace FaculdadeVincit.DesingPatterns.DecoratorPattern;

public class CaféAdicionalDeAcucar : CafeDecorator
{
    public CaféAdicionalDeAcucar(ICafe cafe) : base(cafe)
    {

    }

    public override string Descricao => $"{base.Descricao} com açúcar";

    public override double Custo => base.Custo + 0.50;

}
