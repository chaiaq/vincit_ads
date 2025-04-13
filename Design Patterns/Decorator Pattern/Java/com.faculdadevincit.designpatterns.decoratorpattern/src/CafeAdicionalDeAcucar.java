public class CafeAdicionalDeAcucar extends CafeDecorator{

    public CafeAdicionalDeAcucar(ICafe cafe) {
            super(cafe);
        }
    
    @Override
    public double getCusto() {
        double custo = super.getCusto();
        custo += 0.50;
        return custo;
    }

    @Override
    public String getDescricao() {
        String descricao = super.getDescricao();
        descricao += " com açúcar";
        return descricao;
    }

}
