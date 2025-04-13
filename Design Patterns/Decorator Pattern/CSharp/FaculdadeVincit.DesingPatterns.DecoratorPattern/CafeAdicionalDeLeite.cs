namespace FaculdadeVincit.DesingPatterns.DecoratorPattern;

public class CafeAdicionalDeLeite : CafeDecorator
{
    public CafeAdicionalDeLeite(ICafe cafe) : base(cafe)
    {
    }

    public override string Descricao => $"{base.Descricao} com leite";

    public override double Custo => base.Custo + 1.00;


}
