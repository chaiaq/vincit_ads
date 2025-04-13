namespace FaculdadeVincit.DesignPatterns.CommandPattern;

public class ControleRemoto
{
    public ICommand? command { get; set; }

    public void PressionarBotao() => command?.Executar();
    public void DesfazerPressionar() => command?.Desfazer();
}
