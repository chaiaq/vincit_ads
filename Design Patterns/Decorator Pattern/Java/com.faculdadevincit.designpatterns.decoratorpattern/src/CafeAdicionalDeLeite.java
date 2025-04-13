public class CafeAdicionalDeLeite extends CafeDecorator{

    public CafeAdicionalDeLeite(ICafe cafe) {
            super(cafe);
        }
    
    @Override
    public double getCusto() {
        double custo = super.getCusto();
        custo += 1.00;
        return custo;
    }

    @Override
    public String getDescricao() {
        String descricao = super.getDescricao();
        descricao += " com leite";
        return descricao;
    }

}
