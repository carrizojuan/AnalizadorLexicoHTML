/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package codigo;

import java.awt.Color;
import java.awt.Image;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.io.StringReader;
import java.nio.file.Files;
import java.util.logging.Level;
import java.util.logging.Logger;
import java_cup.runtime.Symbol;
import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JFileChooser;

/**
 *
 * @author gonzalo 
 */
public class FrmPrincipal extends javax.swing.JFrame {
        
        NumeroLinea NumLinea1;
    public FrmPrincipal() {
        initComponents();
        NumLinea1 = new NumeroLinea (txtArchivo);
        jScrollPane2.setRowHeaderView(NumLinea1);
        ImageIcon imagen=new ImageIcon ("src/UTN/logoutnwhite.png") ;
        Icon icono =new ImageIcon (imagen.getImage().getScaledInstance(lblfondo.getWidth(), lblfondo.getHeight(), Image.SCALE_DEFAULT));
        lblfondo.setIcon(icono);
        this.repaint();
       
        
        
        this.getContentPane().setBackground(Color.black);
        this.setResizable(false);
        this.setLocationRelativeTo(null);
        this.setIconImage(new ImageIcon(getClass().getResource("/UTN/carri.png")).getImage());
    }

   private void analizarLexico() throws IOException{
        int palabra = 1;
        
        String expr = (String) txtArchivo.getText();
        Lexer lexer = new Lexer(new StringReader(expr));
        String resultado = "LINEA " + palabra + "\t\tSIMBOLO\n";
        while (true) {
            Tokens tokens = lexer.yylex();
                if (tokens == null) {
                    resultado += "\nFIN DE ANALISIS";
                    txtResultado.setText(resultado);
                    return;
                }
                palabra = palabra + 1;
               switch (tokens) {
                    case AperturaMetaNameConAtributo: 
                    case Imagen: case InicioDocumento: case EspacioVacio: case AtributoTabla:
                    case AperturaLibreriaHTML: case CierreDeDocumento: case AperturaHead: case CierreHead:
                    case AperturaMetaName: case AperturaTitle: case CierreTitulo:
                    case AperturaBody: case CierreBody: case UnaLineaHorizontal: case InicioDeParrafo:
                    case FinDeParrafo: case SaltoDeLinea: case InicioNegrita: case FinNegrita: case InicioMarcadoConEnfasis:
                    case FinMarcadoConEnfasis: case InicioResaltadoEm: case FinResaltadoEm: case Espacio: case AperturaDivision:
                    case CierreDivision: case AperturaSeccion: case CierreSeccion: case AperturaTitulo1: case CierreTitulo1:
                    case AperturaTitulo2: case CierreTitulo2: case AperturaTitulo3: case CierreTitulo3: case AperturaTitulo4:
                    case CierreTitulo4: case AperturaTitulo5: case CierreTitulo5: case AperturaTitulo6: case CierreTitulo6:
                    case AperturaDeListaOrdenada: case CierreDeListaOrdenada: case AperturaListaDesordenada: case CierreListaDesordenada:
                    case ItemEnLaLista: case CierreDeItemEnLaLista: case TablaConBorde: case InicioDeTabla: case CierreDeTabla:
                    case InicioDeTituloDeTabla: case FinDeTituloDeTabla: case InicioDeCabezaDeTabla: case CierreDeCabezaDeTabla:
                    case InicioDePieDeTabla: case FinDePieDeTabla: case InicioDeCuerpoDeTabla: case FinDeCuerpoDeTabla:    
                    case InicioDeCelda: case CierreDeCelda: case InicioDeColumna: case CierreDeColumna:
                    case InicioDefila: case CierreDeFila: case CierreF: case SignoIgual:             
                    case AperturaDeIdiomaHTML: case InicioDeParrafoConAtributo: case ParrafoConAtributo: case AperturaHeadConAtributo: 
                    case AperturaTitleConAtributo: case AperturaBodyConAtributo: case InicioMarcadoConEnfasisConAtributo: case AperturaDivisionConAtributo:
                    case InicioResaltadoEmConAtributo: case InicioResaltadoMark: case InicioResaltadoMarkConAtributo: case FinResaltadoMark:
                    case AperturaTitulo1ConAtributo: case AtributoTARGET: case AtributoHREF:
                    case AperturaTitulo2ConAtributo: case AperturaTitulo3ConAtributo:
                    case AperturaTitulo4ConAtributo: case AperturaTitulo5ConAtributo:
                    case AperturaTitulo6ConAtributo: case AperturaDeListaOrdenadaConAtributo:
                    case AperturaListaDesordenadaConAtributo: case ItemEnLaListaConAtributo:
                    case TablaConBordeConAtributo: case InicioDeTituloDeTablaConAtributo:
                    case InicioDeCabezaDeTablaConAtributo: case InicioDePieDeTablaConAtributo:
                    case InicioDeCuerpoDeTablaConAtributo: case InicioDeCeldaConAtributo:
                    case InicioDeColumnaConAtributo: case InicioDefilaConAtributo: case Url:
                    case AperturaSeccionConAtributo: case AtributoMeta: case Content:
                        resultado += "Palabra "+palabra+", "+lexer.lexeme+" es un " + tokens + "\n";
                    break;                           
                    case texto: case Numero:
                        resultado += "Palabra "+palabra+", "+lexer.lexeme+" es un " + tokens + "\n";
                    break;
                    case ERROR:
                        resultado += "Palabra "+palabra+", "+lexer.lexeme+" Syntax error\n";
                     break;
                     default:
                        resultado += "Palabra "+palabra+", "+tokens+"\n";
                     break;           
                }
            }
    }
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jOptionPane1 = new javax.swing.JOptionPane();
        jFrame1 = new javax.swing.JFrame();
        btnAnalizar = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        txtResultado = new javax.swing.JTextArea();
        btnAbrirtxt = new javax.swing.JButton();
        jScrollPane3 = new javax.swing.JScrollPane();
        txtSyntax = new javax.swing.JTextPane();
        btnAnSyntax = new javax.swing.JButton();
        lblfondo = new javax.swing.JLabel();
        jScrollPane4 = new javax.swing.JScrollPane();
        jScrollPane2 = new javax.swing.JScrollPane();
        txtArchivo = new javax.swing.JTextPane();

        jOptionPane1.setBorder(null);

        javax.swing.GroupLayout jFrame1Layout = new javax.swing.GroupLayout(jFrame1.getContentPane());
        jFrame1.getContentPane().setLayout(jFrame1Layout);
        jFrame1Layout.setHorizontalGroup(
            jFrame1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 400, Short.MAX_VALUE)
        );
        jFrame1Layout.setVerticalGroup(
            jFrame1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 300, Short.MAX_VALUE)
        );

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("ANALIZADOR HTML");
        setBackground(new java.awt.Color(0, 51, 255));
        setBounds(new java.awt.Rectangle(0, 0, 0, 0));
        setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        setLocation(new java.awt.Point(0, 0));
        setResizable(false);

        btnAnalizar.setBackground(new java.awt.Color(0, 51, 51));
        btnAnalizar.setFont(new java.awt.Font("Copperplate Gothic Bold", 0, 14)); // NOI18N
        btnAnalizar.setForeground(new java.awt.Color(255, 255, 255));
        btnAnalizar.setText("ANALISIS LEXICO");
        btnAnalizar.setToolTipText("Luego de escribir el código en el cuadro de la izquierda dar click aquí.");
        btnAnalizar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAnalizarActionPerformed(evt);
            }
        });

        txtResultado.setEditable(false);
        txtResultado.setColumns(20);
        txtResultado.setRows(5);
        txtResultado.setToolTipText("Aquí se identificaran todas las palabras utilizadas.");
        jScrollPane1.setViewportView(txtResultado);

        btnAbrirtxt.setBackground(new java.awt.Color(0, 51, 51));
        btnAbrirtxt.setFont(new java.awt.Font("Copperplate Gothic Bold", 0, 18)); // NOI18N
        btnAbrirtxt.setForeground(new java.awt.Color(255, 255, 255));
        btnAbrirtxt.setText("BUSCAR DOCUMENTO");
        btnAbrirtxt.setToolTipText("Debe seleccionar este botón y buscar el archivo txt con el código a analizar."); // NOI18N
        btnAbrirtxt.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                btnAbrirtxtMouseClicked(evt);
            }
        });
        btnAbrirtxt.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAbrirtxtActionPerformed(evt);
            }
        });

        txtSyntax.setEditable(false);
        jScrollPane3.setViewportView(txtSyntax);

        btnAnSyntax.setBackground(new java.awt.Color(0, 51, 51));
        btnAnSyntax.setFont(new java.awt.Font("Copperplate Gothic Bold", 0, 14)); // NOI18N
        btnAnSyntax.setForeground(new java.awt.Color(255, 255, 255));
        btnAnSyntax.setText("ANALISIS SINTACTICO");
        btnAnSyntax.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAnSyntaxActionPerformed(evt);
            }
        });

        lblfondo.setBackground(new java.awt.Color(0, 0, 0));
        lblfondo.setForeground(new java.awt.Color(255, 255, 255));
        lblfondo.setToolTipText("ACOSTA, MATIAS  RIOS LUCAS  CARRIZO JUAN CRUZ ZOLOAGA GONZALO");

        jScrollPane2.setViewportView(txtArchivo);

        jScrollPane4.setViewportView(jScrollPane2);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(13, 13, 13)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane4)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(btnAnalizar, javax.swing.GroupLayout.DEFAULT_SIZE, 460, Short.MAX_VALUE)
                            .addComponent(jScrollPane1)
                            .addGroup(layout.createSequentialGroup()
                                .addGap(35, 35, 35)
                                .addComponent(btnAbrirtxt, javax.swing.GroupLayout.PREFERRED_SIZE, 386, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(btnAnSyntax, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addGroup(layout.createSequentialGroup()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(lblfondo, javax.swing.GroupLayout.PREFERRED_SIZE, 450, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(jScrollPane3, javax.swing.GroupLayout.PREFERRED_SIZE, 458, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addGap(0, 0, Short.MAX_VALUE)))))
                .addGap(13, 13, 13))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane4, javax.swing.GroupLayout.DEFAULT_SIZE, 383, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnAnalizar, javax.swing.GroupLayout.PREFERRED_SIZE, 44, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnAnSyntax, javax.swing.GroupLayout.PREFERRED_SIZE, 44, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 216, Short.MAX_VALUE)
                    .addComponent(jScrollPane3))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(btnAbrirtxt, javax.swing.GroupLayout.DEFAULT_SIZE, 72, Short.MAX_VALUE)
                    .addComponent(lblfondo, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap())
        );

        lblfondo.getAccessibleContext().setAccessibleDescription("");

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnAnalizarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAnalizarActionPerformed
        try {
            analizarLexico();
        
// File archivo = new File("archivo.txt");
// PrintWriter escribir;
// int palabra = 0;
// try {
//     escribir = new PrintWriter(archivo);
//     escribir.print(txtEntrada.getText());
//     escribir.close();
// } catch (FileNotFoundException ex) {
//     Logger.getLogger(FrmPrincipal.class.getName()).log(Level.SEVERE, null, ex);
// }

// try {
//     Reader lector = new BufferedReader(new FileReader("archivo.txt"));
//    Lexer lexer = new Lexer(lector);
//    String resultado = "";
//    while (true) {
//
// }
// catch (FileNotFoundException ex) {
//     Logger.getLogger(FrmPrincipal.class.getName()).log(Level.SEVERE, null, ex);
// }catch (IOException ex) {
//    Logger.getLogger(FrmPrincipal.class.getName()).log(Level.SEVERE, null, ex);
//}
// TODO add your handling code here:
// TODO add your handling code here:
        } catch (IOException ex) {
            Logger.getLogger(FrmPrincipal.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_btnAnalizarActionPerformed

    private void btnAbrirtxtActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAbrirtxtActionPerformed
        JFileChooser chooser = new JFileChooser();
        chooser.showOpenDialog(null);
        File archivo = new File(chooser.getSelectedFile().getAbsolutePath());
               
        try {
            String ST = new String(Files.readAllBytes(archivo.toPath()));
            txtArchivo.setText(ST);
        }
        catch (FileNotFoundException ex) {
            Logger.getLogger(FrmPrincipal.class.getName()).log(Level.SEVERE, null, ex);
        }       
        catch (IOException ex) {
            Logger.getLogger(FrmPrincipal.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }//GEN-LAST:event_btnAbrirtxtActionPerformed

    private void btnAnSyntaxActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAnSyntaxActionPerformed
 
        String ST = txtArchivo.getText();
        Sintax s = new Sintax(new codigo.LexerCup(new StringReader(ST)));
        
        try {
            s.parse();
            txtSyntax.setText("BUILD SUCCESSFUL ");
            txtSyntax.setForeground(new Color(25, 111, 61));
        } catch (Exception ex) {
            Symbol sym = s.getS();
            txtSyntax.setText("Error syntax. Linea: " + (sym.right + 1) + " Columna: " + (sym.left + 1) + " Texto: " + sym.value);
            txtSyntax.setForeground(Color.RED);
        }
    }//GEN-LAST:event_btnAnSyntaxActionPerformed

    private void btnAbrirtxtMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_btnAbrirtxtMouseClicked
        // TODO add your handling code here:
    }//GEN-LAST:event_btnAbrirtxtMouseClicked

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(FrmPrincipal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(FrmPrincipal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(FrmPrincipal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(FrmPrincipal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new FrmPrincipal().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAbrirtxt;
    private javax.swing.JButton btnAnSyntax;
    private javax.swing.JButton btnAnalizar;
    private javax.swing.JFrame jFrame1;
    private javax.swing.JOptionPane jOptionPane1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JScrollPane jScrollPane4;
    private javax.swing.JLabel lblfondo;
    private javax.swing.JTextPane txtArchivo;
    private javax.swing.JTextArea txtResultado;
    private javax.swing.JTextPane txtSyntax;
    // End of variables declaration//GEN-END:variables
}
