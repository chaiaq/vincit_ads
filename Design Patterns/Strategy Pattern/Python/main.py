from pagamento_cheque import PagamentoCheque
from pagamento_credito import PagamentoCredito
from pagamento_pix import PagamentoPix
from sacola_de_compras import SacolaDeCompras


sacola = SacolaDeCompras()
sacola.pagamento = PagamentoCheque()
sacola.realizar_pagamento(1800)

sacola = SacolaDeCompras()
sacola.pagamento = PagamentoCredito()
sacola.realizar_pagamento(1800)

sacola = SacolaDeCompras()
sacola.pagamento = PagamentoPix()
sacola.realizar_pagamento(1800)

sacola = SacolaDeCompras()
sacola.realizar_pagamento(1800)