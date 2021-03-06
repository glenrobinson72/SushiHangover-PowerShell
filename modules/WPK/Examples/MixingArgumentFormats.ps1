# This demonstrates the different ways you can specify values for a command with WPK.
# You can either use a literal value, a script block, or XML.
New-Window {
    New-Canvas -RenderTransform '<TransformGroup>
	<ScaleTransform ScaleX="2" ScaleY="2"/>
    <SkewTransform AngleX="0" AngleY="0"/>
    <RotateTransform Angle="0"/>
    <TranslateTransform X="0" Y="0"/>
</TransformGroup>
' -Children {'
        <Canvas xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml" x:Name="Document" Width="127.761" Height="126.185" Clip="F1 M 0,0L 127.761,0L 127.761,126.185L 0,126.185L 0,0">
        	<Canvas x:Name="Layer_1" Width="799.505" Height="599.88" Canvas.Left="0" Canvas.Top="0">
        		<Path x:Name="Path" Width="127.761" Height="126.185" Canvas.Left="1.14441e-005" Canvas.Top="0" Stretch="Fill" StrokeLineJoin="Round" Stroke="#FF000000" Fill="#FF814646" Data="F1 M 0.500011,42.6085L 9.92953,98.3211L 59.3666,125.685L 111.584,104.095L 127.261,49.8081L 94.5927,3.7041L 38.1786,0.5L 0.500011,42.6085 Z "/>
        	</Canvas>
        </Canvas>
        '
        New-Button -top 200 -left 200 "Click Me" -On_Click { 
            $window.Close()
        }
    }
} -show